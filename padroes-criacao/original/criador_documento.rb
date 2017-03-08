class CriadorDocumento
  def initialize(tipo_documento)
    @tipo_documento = tipo_documento

    @titulo = "Padroes de projeto"
    @texto = "Aula de padroes de projeto na disciplina Engenharia de Software I."
    @empresa = "Universidade Federal da Bahia"
  end

  def gera_documento
    # Configura cabecalho
    cabecalho = nil;
    if (@tipo_documento == TipoDocumento::HTML)
      cabecalho = CabecalhoHTML.new
    else
      cabecalho = CabecalhoMarkdown.new
    end
    cabecalho.titulo = @titulo
    cabecalho.empresa = @empresa
    
    # Configura corpo
    corpo = nil;
    if (@tipo_documento == TipoDocumento::HTML)
      corpo = CorpoHTML.new
    else
      corpo = CorpoMarkdown.new
    end
    corpo.texto = @texto
    
    # Configura rodape
    rodape = nil;
    if (@tipo_documento == TipoDocumento::HTML)
      rodape = RodapeHTML.new
    else
      rodape = RodapeMarkdown.new
    end
    rodape.data = Time.new
    
    # Retorna a documentacao
    "#{cabecalho.output}#{corpo.output}#{rodape.output}"
  end
end