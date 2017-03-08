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