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

    # before do
    #  allow_any_instance_of(clazz).to receive(opts[:method]).and_return(true)
    #  Hecate::CLI.start
    # end

    # it "calls #{opts[:method]}" do
    #  cli = Hecate::CLI.new
    #  expect(cli.cli_cmd(class: opts[:class], method: opts[:method], opt: {})).to eq 0
    # end
  end
end
