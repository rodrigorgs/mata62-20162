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
