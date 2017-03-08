class CriadorDocumento
  def initialize(factory)
    @factory = factory

    @titulo = "Padroes de projeto"
    @texto = "Aula de padroes de projeto na disciplina Engenharia de Software I."
    @empresa = "Universidade Federal da Bahia"
  end

  def gera_documento
    # Configura cabecalho
    cabecalho = @factory.cria_cabecalho
    cabecalho.titulo = @titulo
    cabecalho.empresa = @empresa
    
    # Configura corpo
    corpo = @factory.cria_corpo
    corpo.texto = @texto
    
    # Configura rodape
    rodape = @factory.cria_rodape
    rodape.data = Time.new
    
    # Retorna a documentacao
    "#{cabecalho.output}#{corpo.output}#{rodape.output}"
  end


end