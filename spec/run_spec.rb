require 'spec_helper'
require 'yacli/run'

include Helpers

describe Yacli::Run do
  context 'run is successfull' do
    let(:opt) do
      {
        'cmd'     => 'date',
        'dry-run' => false,
      }
    end
    let(:output) { 'Success' }

    before do
      allow_any_instance_of(Yacli::Run).to receive(:pass_cli).and_return(nil)
    end

    it 'print date' do
      cmd = 'date'
      allow_any_instance_of(Yacli::Run).to receive(:pass_cli).with(cmd).and_return(output)
      run = Yacli::Run.new(opt)
      expect(run.go(cmd)).to eq output
    end
  end
end
