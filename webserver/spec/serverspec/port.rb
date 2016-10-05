require 'serverspec'

# Required by serverspec
set :backend, :exec

  describe 'webserver::default' do

  it "is listening on port 9418" do
    expect(port(8080)).to be_listening
  end

  end


  