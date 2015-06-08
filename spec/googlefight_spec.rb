require "lita-googlefight"
require "lita/rspec"
# A compatibility mode is provided for older plugins upgrading from Lita 3. Since this plugin
# was generated with Lita 4, the compatibility mode should be left disabled.
Lita.version_3_compatibility_mode = false

describe Lita::Handlers::Googlefight, lita_handler: true do

    it { is_expected.to route_command("!googlefight this;that").to(:googlefight) }
    it { is_expected.to route_command("!gf 'another this';'another that'").to(:googlefight) }

end
