#!/usr/bin/env ruby
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
  File.open(dst || src.sub(/md$/, 'html'), "w+") do |dst|
    signature = File.read("CV.html")

    # 1. Structure HTML et CSS à partir du modèle
    File.open("fichiers/modele_article.html") do |mod|
      dst << mod.sub(/<body>.*\Z/, '')
    end

    # 2. L'article lui-même
    content = md2glmf(File.read(src), signature)
    content.encode("ISO-8859-1")  # Ligne à commenter si vous utilisez du latin-1
    dst << content

    # 3. la signature et fin du document
    File.open("CV.html") do |mod|
      dst << mod.sub(/<body>.*\Z/, "<body>\n\n")
    end if File.exists("CV.html")
  end
end


def md2glmf(markdown, signature)
  content = ""
  lines   = markdown.lines.to_a

  # Titre et signature
  content << lines.unshift << "\n"
  line = lines.unshift
  line = lines.unshift if line =~ /^=+$/
  content << signature.lines.first << "\n"

  # Chapeau
  line = lines.unshift while line.blank? && lines.any?
  content << '<p class="chapeau">'
  do
    content << line
    line = line.unshift
  until line.blank?
  content << "</p>\n\n"

  content
end


class String
  def blank?
    self !~ /\S/
  end
end


main(ARGV[0], ARGV[1])
