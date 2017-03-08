Dir[File.dirname(__FILE__) + '/*.rb'].each {|file| require file }

def main
  factory = ElementoMarkdownFactory.new
  criador = CriadorDocumento.new(factory)
  puts criador.gera_documento
end

if __FILE__ == $0
  main
end