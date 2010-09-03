#!/usr/bin/env ruby
# encoding: UTF-8
#
# Ce script sert à transformer un article écrit en markdown
# vers le HTML spécifique à GLMF (GNU/Linux Magazine France).
#
# Les informations de formattage pour GLMF sont tirés de
# http://www.ed-diamond.com/articles.
#
# Mode d'emploi :
#   1. Modifier le mini CV dans le fichier CV.html
#   2. Écrivez votre article avec un balisage markdown
#   3. Transformez le tout en lançant ./md2glmf.rb article.md
#   4. Vérifiez le résultat en ouvrant le fichier article.html
#
# Note : je préfère utiliser un encodage en UTF-8 pour écrire
# l'article mais le résultat doit être en latin1. Je fais donc
# une convertion de l'encodage dans ce script. Si la source de
# votre article en latin-1, commentez la ligne de convertion.


if ARGV.empty?
  puts "Usage: ruby md2glmf.rb foobar.md [foobar.html]"
  exit -1
end

unless File.readable?(ARGV.first)
  puts "Impossible d'ouvrir le fichier #{ARGV.first}"
  exit -1
end


def main(src, dst)
  File.open(dst || src.sub(/(md|txt)$/, 'html'), "w+") do |dst|
    signature = File.read("CV.html")
    signature.encode("ISO-8859-1")  # Ligne à commenter si vous utilisez du latin-1

    # 1. Structure HTML et CSS à partir du modèle
    model = File.read("fichiers/modele_article.html")
    model.force_encoding("ISO-8859-1")
    dst << model.sub(/<body>.*\Z/, '')

    # 2. L'article lui-même
    content = md2glmf(File.read(src), signature)
    content.encode("ISO-8859-1")  # Ligne à commenter si vous utilisez du latin-1
    dst << content

    # 3. la signature et fin du document
    dst << signature
    dst << "</body>\n</html>\n"
  end
end


def md2glmf(markdown, signature)
  content = ""
  lines   = markdown.lines.map { |l| l.chomp }

  # Titre et signature
  content << lines.shift << "\n"
  line = lines.shift
  line = lines.shift if line =~ /^=+$/
  content << signature.lines.first << "\n"

  # Chapeau
  line = lines.shift while line.blank? && lines.any?
  content << '<p class="chapeau">'
  begin
    content << line
    line = lines.shift
  end until line.blank?
  content << "</p>\n\n"

  while lines.any?
    case line

    # Blank lines
    when /^\s*$/
      content << "\n"

    # Titles
    when /^(\#{1,4})\s*(.*?)\s*\#*$/
      content << "<p class=\"Titre#{$1.length}\">#{$2}</p>\n"

    # Code
    when /^\s{4}(.*)$/
      content << "<code>"
      content << inline_code($1)
      content << "</code>\n"

    # Image
    when /^!\[(.*)\]\((.*\))/
      content << "<p class=\"pragma\">/// Image : #{$2} ///</p>\n"
      content << "<p class=\"legende\">#{$1}</p>\n"
      content << "<p class=\"pragma\">/// Fin légende ///</p>\n"

    # Notes
    when /^<(code|console|note|pragma)>(.*)<\/\1>/
      content << "<p class=\"#{$1}\">" << inline_txt($2) << "</p>\n"

    # Normal text
    else
      content << '<p class="normal">' << inline_txt(line) << "</p>\n"

    end
    line = lines.shift
  end

  content
end


def inline_txt(line)
  line.gsub!(/`([^`]*)`/, '<span class="code_par">\1</span>')
  line.gsub!(/_([^_]*)_/, '<span class="italic">\1</span>')
  line.gsub!(/\*\*(.*)\*\*/, '<span class="gras">\1</span>')
  line.gsub!(/<(menu|url)>(.*)<\/\1>/, '<span class="\1">\2</span>')
  line.gsub!(/</, "&lt;")
  line.gsub!(/>/, "&gt;")
  line.gsub!(/&lt;(\/?)span/, '<\1span')
  line.gsub!(/span&gt;/, 'span>')
  line
end


def inline_code(line)
  line.gsub!(/<(code_em)>(.*)<\/\1>/, '<span class="\1">\2</span>')
  line.gsub!(/</, "&lt;")
  line.gsub!(/>/, "&gt;")
  line.gsub!(/&lt;(\/?)span/, '<\1span')
  line.gsub!(/span&gt;/, 'span>')
  line
end


class String
  def blank?
    self !~ /\S/
  end
end


main(ARGV[0], ARGV[1])
