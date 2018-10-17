require 'spec_helper'
require 'yacli/base'

include Helpers

describe Yacli::Run do
  context 'run is successfull' do
    let(:options_hash) { { :monkey=>false, :name=>nil, :num_limbs=>4, :help=>false } }

    before do
      #allow_any_instance_of(Yacli::Run).to receive(:pass_cli).and_return(nil)
    end

    it 'parse options' do
      opts = Yacli::Base.options do
        opt :monkey, "Use monkey mode"                    # flag --monkey, default false
        opt :name, "Monkey name", :type => :string        # string --name <s>, default nil
        opt :num_limbs, "Number of limbs", :default => 4  # integer --num-limbs <i>, default to 4
      end
      
      expect(opts).to eq options_hash
    end
  end
end
