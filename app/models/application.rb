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

    BUCKET_TYPES = [ "TRANSITION", "TRANSFORMATION", "DEEP DIVE", "SPECIAL HANDLING", "OUT OF SCOPE", "NONE" ]
    PHASE_TYPES = [ "PHASE 1", "PHASE 2", "PHASE 3", "NONE" ]
    SOLUTION_TYPES = ["NO SOLUTION", "PUBLIC CLOUD", "PRIVATE CLOUD", "HYBRID CLOUD", "MANAGED VIRTUALIZATION", "DEDICATED", "COLO" ]

    validates :customer_id,
      :name,
      :servers,
      :tiers,
      :style,
      :provider,
      :customization,
      :consumer,
      :consumption,
      :transport,
      :integration,
      :inhouse,
      :contracted,
      :criticality,
      :sensitivity,
      :regulatory,
      :constraint, presence: true

    validates_uniqueness_of :name, :scope => :customer_id

    validates :servers, numericality: { only_integer: true }
    validates :tiers, numericality: { only_integer: true }

    validates :name, length: { minimum: 2, maximum: 100 }

    validates_inclusion_of :constraint, :in => Application::TIME_WINDOWS

    validates_inclusion_of :bucket, :in => Application::BUCKET_TYPES
    validates_inclusion_of :phase, :in => Application::PHASE_TYPES
    validates_inclusion_of :solution, :in => Application::SOLUTION_TYPES

end
