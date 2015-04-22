# encoding: utf-8
#
# Cookbook Name:: jenkins-hardening
# Recipe:: proxy
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

# Installs nginx as proxy for jenkins
include_recipe 'nginx::default'

# Install ssl certificate
ssl = data_bag_item('jenkins', 'ssl')

file "#{node['nginx']['dir']}/conf.d/jenkins.cert" do
  content ssl['client']['cert']
  owner 'root'
  group node['root_group']
  mode '0644'
end

file "#{node['nginx']['dir']}/conf.d/jenkins.key" do
  content ssl['client']['key']
  owner 'root'
  group node['root_group']
  mode '0600'
end

# update nginx
template "#{node['nginx']['dir']}/conf.d/jenkins.conf" do
  source 'jenkins-site.erb'
  owner 'root'
  group node['root_group']
  mode '0644'
  notifies :reload, 'service[nginx]'
end
