#
# Cookbook Name:: rightscale_backup
# Library:: resource_rightscale_backup
#
# Copyright (C) 2013 RightScale, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require 'chef/resource'
require 'chef/resource/lwrp_base'

class Chef
  class Resource
    # A Chef resource for managing volume backups in RightScale environment.
    #
    class RightscaleBackup < Chef::Resource::LWRPBase
      provides :rightscale_backup
      resource_name :rightscale_backup
      # Initializes rightscale_backup resource.
      #
      # @param name [String] name of the resource.
      # @param run_context [Chef::RunContext] optional value to track context of
      # a chef run.
      # @return [Chef::Resource::RightscaleBackup] the newly created
      # rightscale_backup resource.
      #
      # def initialize(name, run_context = nil)
      #  super
      #  @resource_name = :rightscale_backup
      #  @action = :create
      #  @allowed_actions.push(:create, :restore, :cleanup)
      #  @provider = Chef::Provider::RightscaleBackup
      # end
      actions :create, :restore, :cleanup
      default_action :create

      # Name of the backup.
      #
      # @param arg [String] the backup name
      #
      # @return [String] the backup name
      #
      # def nickname(arg = nil)
      #   set_or_return(
      #    :name,
      #    arg,
      #    kind_of: String
      #   )
      # end
      attribute :nickname, kind_of: String, name_attribute: true, required: true

      # Description for the backup.
      #
      # @param arg [String] the backup description
      #
      # @return [String] the backup description
      #
      # def description(arg = nil)
      #   set_or_return(
      #     :description,
      #     arg,
      #     kind_of: String
      #   )
      # end
      attribute :description, kind_of: String

      # Lineage to which the backup belongs.
      #
      # @param arg [String] the backup lineage
      #
      # @return [String] the backup lineage
      #
      # def lineage(arg = nil)
      #   set_or_return(
      #     :lineage,
      #     arg,
      #     required: true,
      #     kind_of: String
      #   )
      # end
      attribute :lineage, kind_of: String, required: true

      # UNIX timestamp at which the backup was taken.
      #
      # @param arg [Integer, Time] the backup timestamp
      #
      # @return [Integer, Time] the backup timestamp
      #
      # def timestamp(arg = nil)
      #   set_or_return(
      #     :timestamp,
      #     arg,
      #     kind_of: [Integer, Time]
      #   )
      # end
      attribute :timestamp, kind_of: [Integer, Time]

      # Devices to be backed up.
      #
      # @param arg [Array<String>] the devices to be backed up
      #
      # @return [Array<String>] the devices to be backed up
      #
      # def devices(arg = nil)
      #   set_or_return(
      #     :devices,
      #     arg,
      #     kind_of: Array
      #   )
      # end
      attribute :devices, kind_of: Array

      # Flag to specify that the backup was taken from a master (usually database).
      # By default, this value is false.
      #
      # @param arg [Boolean] the from master flag
      #
      # @return [Boolean] the from master flag
      #
      # def from_master(arg = nil)
      #   set_or_return(
      #     :from_master,
      #     arg,
      #     kind_of: [TrueClass, FalseClass],
      #     equal_to: [true, false],
      #     default: false
      #   )
      # end
      attribute :from_master, kind_of: [TrueClass, FalseClass], equal_to: [true, false], default: false

      # Size of the volume during restore.
      #
      # @param arg [Integer] the volume size during restore
      #
      # @return [Integer] the volume size during restore
      #
      # def size(arg = nil)
      #   set_or_return(
      #     :size,
      #     arg,
      #     kind_of: Integer
      #   )
      # end
      attribute :size, kind_of: Integer

      # Timeout value (in minutes) for actions supported by rightscale_backup
      # resource. By default, this value is set to 15 minutes.
      #
      # @param arg [Integer] the timeout value
      #
      # @return [Integer] the timeout value
      #
      # def timeout(arg = nil)
      #   set_or_return(
      #     :timeout,
      #     arg,
      #     default: 15,
      #     kind_of: Integer
      #   )
      # end
      attribute :timeout, kind_of: Integer, default: 15

      # Number of old backups to keep. By default, this is set to 60.
      #
      # @param arg [Integer] the number of backups to keep
      #
      # @return [Integer] the number of backups to keep
      #
      # def keep_last(arg = nil)
      #   set_or_return(
      #     :keep_last,
      #     arg,
      #     default: 60,
      #     kind_of: Integer
      #   )
      # end
      attribute :keep_last, kind_of: Integer, default: 60

      # Number of daily backups to keep. By default, this is set to 1.
      #
      # @param arg [Integer] the number of daily backups to keep
      #
      # @return [Integer] the number of daily backups to keep
      #
      # def dailies(arg = nil)
      #   set_or_return(
      #     :dailies,
      #     arg,
      #     default: 1,
      #     kind_of: Integer
      #   )
      # end
      attribute :dailies, kind_of: Integer, default: 1

      # Number of monthly backups to keep. By default, this is set to 12.
      #
      # @param arg [Integer] the number of monthly backups to keep
      #
      # @return [Integer] the number of monthly backups to keep
      #
      # def monthlies(arg = nil)
      #  set_or_return(
      #     :monthlies,
      #     arg,
      #     default: 12,
      #     kind_of: Integer
      #   )
      # end
      attribute :monthlies, kind_of: Integer, default: 12

      # Number of weekly backups to keep. By default, this is set to 4.
      #
      # @param arg [Integer] the number of weekly backups to keep
      #
      # @return [Integer] the number of weekly backups to keep
      #
      # def weeklies(arg = nil)
      #   set_or_return(
      #     :weeklies,
      #     arg,
      #     default: 4,
      #     kind_of: Integer
      #   )
      # end
      attribute :weeklies, kind_of: Integer, default: 4

      # Number of yearly backups to keep. By default, this is set to 2.
      #
      # @param arg [Integer] the number of yearly backups to keep
      #
      # @return [Integer] the number of yearly backups to keep
      #
      # def yearlies(arg = nil)
      #   set_or_return(
      #     :yearlies,
      #     arg,
      #     default: 2,
      #     kind_of: Integer
      #   )
      # end
      attribute :yearlies, kind_of: Integer, default: 2

      # Hash that holds cloud provider specific attributes such as volume_type
      # ('SATA'/'SSD').
      #
      # @param arg [Hash{Symbol => String}] the optional parameters for actions
      # @option arg [String] :volume_type the volume type of the volume during
      #   restore. Valid only on Rackspace Open Cloud.
      #
      # @return [Hash] the optional parameters
      #
      # def options(arg = nil)
      #   set_or_return(
      #     :options,
      #     arg,
      #     kind_of: Hash,
      #     default: {}
      #   )
      # end
      attribute :options, kind_of: Hash, default: {}
    end
  end
end
