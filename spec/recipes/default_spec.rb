# encoding: UTF-8
#
# Copyright 2014, Christoph Hartmann
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'spec_helper'

describe 'jenkins-hardening::default' do

  # converge
  cached(:chef_run) do
    ChefSpec::SoloRunner.converge(described_recipe)
  end

  before do
    stub_command('which nginx').and_return(true)
    stub_data_bag_item('jenkins', 'ssl').and_return(
      id: 'ssl',
      server: {
        key: '-----BEGIN RSA PRIVATE KEY-----\nSERVERaabbcc=\n-----END RSA PRIVATE KEY-----\n',
        cert: '-----BEGIN CERTIFICATE-----\nSERVERaabbcc=\n-----END CERTIFICATE-----\n',
        cacert: '-----BEGIN CERTIFICATE-----\nSERVERaabbcc==\n-----END CERTIFICATE-----\n'
      },
      client: {
        key: '-----BEGIN RSA PRIVATE KEY-----\nCLIENTaabbcc=\n-----END RSA PRIVATE KEY-----\n',
        cert: '-----BEGIN CERTIFICATE-----\nCLIENTaabbcc==\n-----END CERTIFICATE-----\n'
      })
  end

  # check that the recipes are executed
  it 'includes jenkins recipe' do
    expect(chef_run).to include_recipe('jenkins-hardening::jenkins')
  end

  it 'includes proxy recipe' do
    expect(chef_run).to include_recipe('jenkins-hardening::proxy')
  end

  context 'chef-solo' do
    cached(:chef_run) do
      ChefSpec::SoloRunner.new.converge(described_recipe)
    end

    it 'does not raise an error' do
      expect { chef_run }.not_to raise_error
    end
  end
end
