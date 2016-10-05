require 'chefspec'

describe 'chef_train::default' do
let(:chef_run){ChefSpec::SoloRunner.new.converge(described_recipe) }

it 'installing package apache2' do
 expect(chef_run).to install_package('apache2')
end

it 'to create directory' do
 expect(chef_run).to create_directory('/tmp/train')
end


end
