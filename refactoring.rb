class Filme
  NORMAL = 0
  LANCAMENTO = 1
  INFANTIL = 2
  
  attr_reader :titulo
  attr_reader :codigo_de_preco
  
  def initialize(titulo, codigo_de_preco)
    @titulo, @codigo_de_preco = titulo, codigo_de_preco
  end
end

class Aluguel
  attr_reader :filme, :dias_aluguel
  
  def initialize(filme, dias_aluguel)
    @filme, @dias_aluguel = filme, dias_aluguel
  end
end


class Cliente
  attr_reader :nome
  
  def initialize(nome)
    @nome = nome
    @alugueis = []
  end
  
  def insere_aluguel(arg)
    @alugueis << arg
  end
  
  def recibo
    valor_total, pontos_de_fidelidade = 0, 0
    resultado = "Registro de Aluguel para #{@nome}\n"
    @alugueis.each do |elemento|
      este_valor = 0.0
      
      # determina valores para cada item
      case elemento.filme.codigo_de_preco
      when Filme::NORMAL
        este_valor += 2
        este_valor += (elemento.dias_aluguel - 2) * 1.5 if elemento.dias_aluguel > 2
      when Filme::LANCAMENTO
        este_valor += elemento.dias_aluguel * 3
      when Filme::INFANTIL
        este_valor += 1.5
        este_valor += (elemento.dias_aluguel - 3) * 1.5 if elemento.dias_aluguel > 3
      end
      
      # adiciona pontos de fidelidade
      pontos_de_fidelidade += 1
      # adiciona bonus para um aluguel de dois dias de lancamento
      if elemento.filme.codigo_de_preco == Filme::LANCAMENTO && elemento.dias_aluguel > 1
        pontos_de_fidelidade += 1
      end
      # exibe valor para este aluguel
      resultado += "\t" + elemento.filme.titulo + "\t" + este_valor.to_s + "\n"
      valor_total += este_valor
    end
    # adiciona rodape
    resultado += "Valor devido: #{valor_total}\n"
    resultado += "Voce ganhou #{pontos_de_fidelidade} pontos de fidelidade"
    resultado
  end
end


require "test/unit"
class AluguelDeFilmeTest < Test::Unit::TestCase
  THE_HULK = Filme.new('The Hulk', Filme::INFANTIL);
  IRON_MAN = Filme.new('Iron Man 4', Filme::LANCAMENTO);
  SPIDER_MAN = Filme.new('Spiderman', Filme::NORMAL);
  CLIENTE = Cliente.new('fred')
  
  def setup
    @cliente = Cliente.new('fred')
  end

  def test_aluguel_infantil_basico
    @cliente.insere_aluguel(Aluguel.new(THE_HULK, 2));
    assert_equal "Registro de Aluguel para fred\n" +
        "\tThe Hulk\t1.5\n" +
        "Valor devido: 1.5\n" +
        "Voce ganhou 1 pontos de fidelidade", @cliente.recibo
  end

  def test_deve_descontar_aluguel_infantil
    @cliente.insere_aluguel(Aluguel.new(THE_HULK, 4));
    assert_equal "Registro de Aluguel para fred\n" +
        "\tThe Hulk\t3.0\n" +
        "Valor devido: 3.0\n" +
        "Voce ganhou 1 pontos de fidelidade", @cliente.recibo
  end

  def test_aluguel_lancamento_basico
    @cliente.insere_aluguel(Aluguel.new(IRON_MAN, 1));
    assert_equal "Registro de Aluguel para fred\n" +
        "\tIron Man 4\t3.0\n" +
        "Valor devido: 3.0\n" +
        "Voce ganhou 1 pontos de fidelidade", @cliente.recibo
  end

  def test_nao_deve_descontar_aluguel_lancamento_mas_dar_pontos_de_fidelidade
    @cliente.insere_aluguel(Aluguel.new(IRON_MAN, 4));
    assert_equal "Registro de Aluguel para fred\n" +
        "\tIron Man 4\t12.0\n" +
        "Valor devido: 12.0\n" +
        "Voce ganhou 2 pontos de fidelidade", @cliente.recibo
  end

  def test_aluguel_normal_basico
    @cliente.insere_aluguel(Aluguel.new(SPIDER_MAN, 2));
    assert_equal "Registro de Aluguel para fred\n" +
        "\tSpiderman\t2.0\n" +
        "Valor devido: 2.0\n" +
        "Voce ganhou 1 pontos de fidelidade", @cliente.recibo
  end

  def test_deve_descontar_aluguel_normal
    @cliente.insere_aluguel(Aluguel.new(SPIDER_MAN, 4));
    assert_equal "Registro de Aluguel para fred\n" +
        "\tSpiderman\t5.0\n" +
        "Valor devido: 5.0\n" +
        "Voce ganhou 1 pontos de fidelidade", @cliente.recibo
  end

  def test_deve_somar_varios_alugueis
    @cliente.insere_aluguel(Aluguel.new(THE_HULK, 2));
    @cliente.insere_aluguel(Aluguel.new(SPIDER_MAN, 1));
    @cliente.insere_aluguel(Aluguel.new(IRON_MAN, 3));
    assert_equal "Registro de Aluguel para fred\n" +
        "\tThe Hulk\t1.5\n" +
        "\tSpiderman\t2.0\n" +
        "\tIron Man 4\t9.0\n" +
        "Valor devido: 12.5\n" +
        "Voce ganhou 4 pontos de fidelidade", @cliente.recibo
  end

  def test_recibo_evolucao
    cliente = Cliente.new('Chap')
    filme1 = Filme.new('Joe Versus the Volcano', Filme::NORMAL)
    aluguel1 = Aluguel.new(filme1, 5)
    cliente.insere_aluguel(aluguel1)
        
    assert_equal "Registro de Aluguel para Chap\n" +
        "\tJoe Versus the Volcano\t6.5\n" +
        "Valor devido: 6.5\n" +
        "Voce ganhou 1 pontos de fidelidade", cliente.recibo
    
    
    filme2 = Filme.new('Sleepless in Seattle', Filme::INFANTIL)
    aluguel2 = Aluguel.new(filme2, 1)
    cliente.insere_aluguel(aluguel2)
        
    assert_equal "Registro de Aluguel para Chap\n" +
        "\tJoe Versus the Volcano\t6.5\n" +
        "\tSleepless in Seattle\t1.5\n" +
        "Valor devido: 8.0\n" +
        "Voce ganhou 2 pontos de fidelidade", cliente.recibo
    
    
    filme3 = Filme.new('You\'ve Got Mail', Filme::LANCAMENTO)
    aluguel3 = Aluguel.new(filme3, 15)
    cliente.insere_aluguel(aluguel3)

    assert_equal "Registro de Aluguel para Chap\n" +
        "\tJoe Versus the Volcano\t6.5\n" +
        "\tSleepless in Seattle\t1.5\n" +
        "\tYou've Got Mail\t45.0\n" +
        "Valor devido: 53.0\n" +
        "Voce ganhou 4 pontos de fidelidade", cliente.recibo
  end
end
