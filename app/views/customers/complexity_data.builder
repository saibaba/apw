xml = Builder::XmlMarkup.new(:indent=>0)
options = {
 :caption=>'Complexity',
 :subcaption=>'For Customer '+ @customer.name   ,
 :yAxisName=>'Score',
 :showValues=>'1',
 :exportenabled => "1",
 :exportatclient =>  "1",
 :exporthandler => "fcExporter1"
}

xml.graph(options) do
  @complexity_scores.each { |app_name, complexities|
     xml.set(:value=>complexities['totalScore'],:name=>app_name, :color=>''+get_FC_color)
  }
end
