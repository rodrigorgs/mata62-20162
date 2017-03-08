class CriadorDocumento
  def initialize
    @titulo = "Padroes de projeto"
    @texto = "Aula de padroes de projeto na disciplina Engenharia de Software I."
    @empresa = "Universidade Federal da Bahia"
  end

  def gera_documento
    # Configura cabecalho
    cabecalho = cria_cabecalho
    cabecalho.titulo = @titulo
    cabecalho.empresa = @empresa
    
    # Configura corpo
    corpo = cria_corpo
    corpo.texto = @texto
    
    # Configura rodape
    rodape = cria_rodape
    rodape.data = Time.new
    
    # Retorna a documentacao
    "#{cabecalho.output}#{corpo.output}#{rodape.output}"
  end


end