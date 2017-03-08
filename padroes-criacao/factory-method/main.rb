Dir[File.dirname(__FILE__) + '/*.rb'].each {|file| require file }

def main
  criador = CriadorDocumentoMarkdown.new
  puts criador.gera_documento
end

if __FILE__ == $0
  main
end