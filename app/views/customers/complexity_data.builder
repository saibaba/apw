xml = Builder::XmlMarkup.new(:indent=>0)
options = {
 :caption=>'Complexity',
 :subcaption=>'For Customer '+ @customer.name   ,
 :yAxisName=>'Complexity',
 :xAxisName=>'Application',
 :showValues=>'1',
}

xml.graph(options) do
  @complexity_scores.each { |app_name, complexities|
     xml.set(:value=>complexities['totalScore'],:name=>app_name, :color=>''+get_FC_color)
  }
end
