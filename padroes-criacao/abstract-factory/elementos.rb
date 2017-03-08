class ElementoFactory
  def cria_cabecalho
    raise "Este metodo deve ser implementado por uma subclasse"
  end

  def cria_corpo
    raise "Este metodo deve ser implementado por uma subclasse"
  end

  def cria_rodape
    raise "Este metodo deve ser implementado por uma subclasse"
  end
end

class Cabecalho
  attr_accessor :titulo, :empresa

  def output
    raise "Este metodo deve ser implementado pela subclasse!"
  end
end

class Corpo
  attr_accessor :texto

  def output
    raise "Este metodo deve ser implementado pela subclasse!"
  end
end

class Rodape
  attr_accessor :data

  def output
    raise "Este metodo deve ser implementado pela subclasse!"
  end
end
