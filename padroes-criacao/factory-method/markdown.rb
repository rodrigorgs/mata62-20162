class CriadorDocumentoMarkdown < CriadorDocumento
  def cria_cabecalho
    CabecalhoMarkdown.new
  end

  def cria_corpo
    CorpoMarkdown.new
  end

  def cria_rodape
    RodapeMarkdown.new
  end
end

class CabecalhoMarkdown < Cabecalho
  def output
    "\# #{titulo}\n\n\#\# #{empresa}\n\n"
  end
end

class CorpoMarkdown < Corpo
  def output
    "#{texto}\n\n"
  end
end

class RodapeMarkdown < Rodape
  def output
    "------------------------------\n\n#{data.strftime('%Y-%m-%d')}\n"
  end
end