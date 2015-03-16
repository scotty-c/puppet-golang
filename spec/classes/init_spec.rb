require 'spec_helper'
describe 'golang' do

  let(:facts) { {:osfamily => 'RedHat', :environment => 'production'} }

  context 'with defaults for all parameters' do
    it { should contain_class('golang') }
    

  describe 'vcsrepo' do  
  let(:params) {{
            :name     => 'test',
            :provider => "git",
            :source   => "foo",
            :revision => "master",
        }}
     end   
  end
end



