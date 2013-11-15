xml = Builder::XmlMarkup.new(:indent=>0)
options = {
 :caption=>'Risk',
 :subcaption=>'For Customer '+ @customer.name   ,
 :xAxisName=>'Risk',
 :yAxisName=>'Application',
 :showValues=>'1'
}

xml.graph(options) do
  @risk_scores.each { |app_name, risks|
     xml.set(:name=>app_name,:value=>risks['totalScore'],:color=>''+get_FC_color)
  }
end
