class CriadorDocumentoHTML < CriadorDocumento
  def cria_cabecalho
    CabecalhoHTML.new
  end

  def cria_corpo
    CorpoHTML.new
  end

  def cria_rodape
    RodapeHTML.new
  end
end

class CabecalhoHTML < Cabecalho
  def output
    "<html><head><title>#{titulo}</title></head><body>
        <h1>#{titulo}</h1>
        <h2>#{empresa}</h2>"
  end
end

class CorpoHTML < Corpo
  def output
    "<p>#{texto}</p>"
  end
end

class RodapeHTML < Rodape
  def output
    "<hr/>#{data.strftime('%Y-%m-%d')}</body></html>"
  end
end