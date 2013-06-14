require 'spec_helper'

describe Rack::Maintenance do
  let (:app) { MockApp.new }
  let (:default) { Rack::Maintenance.new(app) }
  let (:non_active) { Rack::Maintenance.new(app, :active => false) }
  let (:invalid_http_status) { Rack::Maintenance.new(app, :status => 99) }

  context 'default behavior' do
    subject { default }
    it { should be_active }
    its (:status) { should == 503 }
    its (:headers) { should == subject.send(:default_headers)}
    its (:body) { should == subject.send(:default_template)}
  end
  
  context "set ':active' option to false" do
    subject { non_active }
    it { should_not be_active }
  end

  context "set invalid options :status => 99" do
    it 'should raise error' do
      proc{ invalid_http_status }.should raise_error Rack::Maintenance::InvalidStatus
    end
  end

  context 'request to exist path with default options' do
    subject { Rack::MockRequest.new(default).get('/') }
    its (:status) { should == 503 }
  end

  context 'request to non_exist path with default options' do
    subject { Rack::MockRequest.new(default).get('/404') }
    its (:status) { should == 503 }
  end

  context 'request to exist path with non_active mode' do
    subject { Rack::MockRequest.new(non_active).get('/') }
    its (:status) { should == 200 }
  end

  context 'request to non_exist path with non_active mode' do
    subject { Rack::MockRequest.new(non_active).get('/404') }
    its (:status) { should == 404 }
  end
end
