$complexityShares = 465
$complexityFactorPercent = {
    "servers" => 20.0/$complexityShares/100,
    "tiers" => 50.0/$complexityShares/20,
    "style" => 100.0/$complexityShares,
    "provider" => 20.0/$complexityShares,
    "customization" => 30.0/$complexityShares,
    "consumer" => 10.0/$complexityShares,
    "consumption" => 100.0/$complexityShares,
    "transport" => 15.0/$complexityShares,
    "integration" => 100.0/$complexityShares,
    "inhouse" => 10.0/$complexityShares,
    "contracted" => 10.0/$complexityShares
}

$riskShares = 240
$riskFactorPercent = {
    "criticality" => 100.0/$riskShares,
    "sensitivity" => 50.0/$riskShares,
    "regulatory" => 70.0/$riskShares,
    "constraint" => 20.0/$riskShares
}

def serversComplexity (n)
    return (n*$complexityFactorPercent["servers"]).round(3)
end

def tiersComplexity(t)
    return (t*$complexityFactorPercent["tiers"]).round(3)
end

def hComplexity(t, s, p, digits=3)
    if t.has_key?(s) then 
        return (t[s] * p).round(digits)
    else 
        return (0.0).round(digits)
    end
end


$archStyle = { "Client/Server" =>  0.75, "Legacy"  => 1, "N-tier" =>  0.5, "SOA" => 0.25 }
def archStyleComplexity(s)
    return hComplexity($archStyle, s, $complexityFactorPercent["style"])
end

$appProvider = { "3rd party" =>   0.5, "Home-grown" =>  1, "Pre-packaged" => 0 }
def providerComplexity(s)
    return hComplexity($appProvider, s, $complexityFactorPercent["provider"])
end

$rating  = { "HIGH" =>    0.75, "LOW" => 0.25, "MODERATE" =>    0.5, "VERY HIGH" =>   1, "VERY LOW" =>   0 }

$customization = $rating
def customizationComplexity(s)
    return hComplexity($customization, s, $complexityFactorPercent["customization"])
end

$consumer = { "Customer" =>    1, "Internal" =>    0, "Partner" => 0.5, "Internal+Partner" =>    0.5 }
def consumerComplexity(s)
    return hComplexity($consumer, s, $complexityFactorPercent["consumer"])
end

$consumption = { "API" => 0, "Browser" => 0, "Fat client" =>  0.75, "Mobile APP" =>  0, "Other" =>   1, "SSH/Telnet/RDP" =>  0.5, "TTY" => 1 }
def consumptionComplexity(s)
    return hComplexity($consumption, s, $complexityFactorPercent["consumption"])
end

$transport = { "Internet/IPSec" =>  0.25, "Internet/Std" =>    0, "LAN" => 0.5, "LL/SONET" =>    1, "MPLS" =>    0.75 }
def transportComplexity(s)
    return hComplexity($transport, s, $complexityFactorPercent["transport"])
end


$integration = $rating
def integrationComplexity(s)
    return hComplexity($integration, s, $complexityFactorPercent["integration"])
end

$yesno =  { "NO" => 1, "YES" => 0 }

$inhouse  = $yesno
def inhouseComplexity(s)
    return hComplexity($inhouse, s, $complexityFactorPercent["inhouse"])
end

$contracted = $yesno
def contractedComplexity(s)
    return hComplexity($contracted, s, $complexityFactorPercent["contracted"])
end


############

$sensitivity  = $rating
def sensitivityComplexity(s)
    return hComplexity($sensitivity, s, $riskFactorPercent["sensitivity"])
end

$bizCriticality =  { "Tier-0" => 1, "Tier-1" => 0.75, "Tier-2" => 0.5, "Tier-3" => 0.25, "Tier-4" => 0 }
def bizComplexity(s)
    return hComplexity($bizCriticality, s, $riskFactorPercent["criticality"])
end

$regulatory  =  { "FISMA" =>   1, "HIPAA" =>   0.5, "PCI-DSS" => 0.75, "SOX" => 0.75, "NONE" =>    0, "OTHER" =>   0.75 }
def regulatoryComplexity(s)
    return hComplexity($regulatory, s, $riskFactorPercent["regulatory"])
end

$constraint = { "< 3 months" =>  1, "3-6 months" =>  0.75, "6-12 months" =>    0.5, "12-24 months" =>   0.25, "> 24 months" =>    0, "NONE" =>   0 }
def constraintComplexity(s)
    return hComplexity($constraint, s, $riskFactorPercent["constraint"])
end

def complexityScores(servers, tiers, archStyle, provider, customization, consumer, consumption, transport, integration, inhouse, contracted)
    rv =  {"servers" => serversComplexity(servers),
    "tiers" => tiersComplexity(tiers),
    "archStyle" => archStyleComplexity(archStyle),
    "provider" => providerComplexity(provider),
    "customization" => customizationComplexity(customization),
    "consumer" => consumerComplexity(consumer),
    "consumption" => consumptionComplexity(consumption),
    "transport" => transportComplexity(transport),
    "integration" => integrationComplexity(integration),
    "inhouse" => inhouseComplexity(inhouse),
    "contracted" => contractedComplexity(contracted) }
    total = 0.0
    rv.each { |k,v| 
        total += v
    }
    rv["totalScore"] = total.round(3)
    return rv
end

def riskScores(biz, sensitivity, regulatory, constraint) 
    rv  = {
        "criticality" => bizComplexity(biz),
        "sensitivity" => sensitivityComplexity(sensitivity),
        "regulatory" => regulatoryComplexity(regulatory),
        "constraint" => constraintComplexity(constraint)
    }
    total = 0.0
    rv.each { |k,v| 
        total += v
    }
    rv["totalScore"] = total.round(3)
    return rv
end

puts serversComplexity(16)
puts tiersComplexity(3)
puts archStyleComplexity("N-tier")
puts providerComplexity("3rd party")
puts customizationComplexity("VERY HIGH")
puts consumerComplexity("Internal")
puts consumptionComplexity("Browser")
puts transportComplexity("LAN")
puts integrationComplexity("HIGH")
puts inhouseComplexity("YES")
puts contractedComplexity("YES")

puts bizComplexity("Tier-1")
puts sensitivityComplexity("HIGH")
puts regulatoryComplexity("OTHER")
puts constraintComplexity("NONE")

puts complexityScores(16, 3, "N-tier", "3rd party", "VERY HIGH", "Internal", "Browser", "LAN", "HIGH", "YES", "YES")
puts riskScores("Tier-1", "HIGH", "OTHER", "NONE")
