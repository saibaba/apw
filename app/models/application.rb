class Application < ActiveRecord::Base
    STYLES    = [ "Client/Server", "Legacy", "N-tier", "SOA" ]
    PROVIDERS = [ "3rd party", "Home-grown", "Pre-packaged" ]
    RATING    = [ "VERY LOW", "LOW", "MODERATE", "HIGH", "VERY HIGH" ]
    CONSUMER_TYPES = [ "Customer", "Internal", "Partner", "Internal+Partner"]
    CONSUMPTION_TYPES = [ "API", "Browser", "Fat client", "Mobile APP", "Other", "SSH/Telnet/RDP", "TTY"]
    TRANSPORT_TYPES = ["Internet/IPSec", "Internet/Std", "LAN", "LL/SONET", "MPLS"]
    YES_NO_TYPES = [ "YES", "NO" ]
    REGULATORY_TYPES = [ "FISMA", "HIPAA", "PCI-DSS", "SOX", "NONE", "OTHER"]
    BIZ_CRITICALITY_TYPES = [ "Tier-0", "Tier-1", "Tier-2", "Tier-3", "Tier-4"]
    TIME_WINDOWS = [ "< 3 months", "3-6 months", "6-12 months", "12-24 months", "> 24 months", "NONE"]

end
