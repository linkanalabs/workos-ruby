# frozen_string_literal: true
# typed: strict

require 'net/http'

module WorkOSV2
  # The Directory Sync module provides convenience methods for working with the
  # WorkOSV2 Directory Sync platform. You'll need a valid API key and to have
  # created a Directory Sync connection on your WorkOSV2 dashboard.
  #
  # @see https://docs.workos.com/directory-sync/overview
  module DirectorySync
    class << self
      extend T::Sig
      include Client

      # Retrieve directories.
      #
      # @param [Hash] options An options hash
      # @option options [String] domain The domain of the directory to be
      #  retrieved.
      # @option options [String] search A search term for direcory names.
      # @option options [String] limit Maximum number of records to return.
      # @option options [String] order The order in which to paginate records
      # @option options [String] before Pagination cursor to receive records
      #  before a provided Directory ID.
      # @option options [String] after Pagination cursor to receive records
      #  before a provided Directory ID.
      # @option options [String] organization_id The ID for an Organization configured on WorkOSV2.
      #
      # @return [Hash]
      sig do
        params(
          options: T::Hash[Symbol, String],
        ).returns(WorkOSV2::Types::ListStruct)
      end
      def list_directories(options = {})
        response = execute_request(
          request: get_request(
            path: '/directories',
            auth: true,
            params: options,
          ),
        )

        parsed_response = JSON.parse(response.body)
        directories = parsed_response['data'].map do |directory|
          ::WorkOSV2::Directory.new(directory.to_json)
        end

        WorkOSV2::Types::ListStruct.new(
          data: directories,
          list_metadata: parsed_response['listMetadata'],
        )
      end

      # Retrieve directory.
      #
      # @param [String] id Directory unique identifier
      #
      # @example
      #   WorkOSV2::SSO.get_directory(id: 'directory_01FK17DWRHH7APAFXT5B52PV0W')
      #   => #<WorkOSV2::Directory:0x00007fb6e4193d20
      #         @id="directory_01FK17DWRHH7APAFXT5B52PV0W",
      #         @name="Foo Corp",
      #         @domain="foo-corp.com",
      #         @type="okta scim v2.0",
      #         @state="linked",
      #         @organization_id="org_01F6Q6TFP7RD2PF6J03ANNWDKV",
      #         @created_at="2021-10-27T15:55:47.856Z",
      #         @updated_at="2021-10-27T16:03:43.990Z"
      #
      # @return [WorkOSV2::Directory]
      sig { params(id: String).returns(WorkOSV2::Directory) }
      def get_directory(id:)
        request = get_request(
          auth: true,
          path: "/directories/#{id}",
        )

        response = execute_request(request: request)

        WorkOSV2::Directory.new(response.body)
      end

      # Retrieve directory groups.
      #
      # @param [Hash] options An options hash
      # @option options [String] directory The ID of the directory whose
      #  directory groups will be retrieved.
      # @option options [String] user The ID of the directory user whose
      #  directory groups will be retrieved.
      # @option options [String] limit Maximum number of records to return.
      # @option options [String] order The order in which to paginate records
      # @option options [String] before Pagination cursor to receive records
      #  before a provided Directory Group ID.
      # @option options [String] after Pagination cursor to receive records
      #  before a provided Directory Group ID.
      #
      # @return [WorkOSV2::DirectoryGroup]
      sig do
        params(
          options: T::Hash[Symbol, String],
        ).returns(WorkOSV2::Types::ListStruct)
      end
      def list_groups(options = {})
        response = execute_request(
          request: get_request(
            path: '/directory_groups',
            auth: true,
            params: options,
          ),
        )

        parsed_response = JSON.parse(response.body)
        groups = parsed_response['data'].map do |group|
          ::WorkOSV2::DirectoryGroup.new(group.to_json)
        end

        WorkOSV2::Types::ListStruct.new(
          data: groups,
          list_metadata: parsed_response['listMetadata'],
        )
      end

      # Retrieve directory users.
      #
      # @param [Hash] options An options hash
      # @option options [String] directory The ID of the directory whose
      #  directory users will be retrieved.
      # @option options [String] user The ID of the directory group whose
      #  directory users will be retrieved.
      # @option options [String] limit Maximum number of records to return.
      # @option options [String] order The order in which to paginate records
      # @option options [String] before Pagination cursor to receive records
      #  before a provided Directory User ID.
      # @option options [String] after Pagination cursor to receive records
      #  before a provided Directory User ID.
      #
      # @return [WorkOSV2::DirectoryUser]
      sig do
        params(
          options: T::Hash[Symbol, String],
        ).returns(WorkOSV2::Types::ListStruct)
      end
      def list_users(options = {})
        response = execute_request(
          request: get_request(
            path: '/directory_users',
            auth: true,
            params: options,
          ),
        )

        parsed_response = JSON.parse(response.body)
        users = parsed_response['data'].map do |user|
          ::WorkOSV2::DirectoryUser.new(user.to_json)
        end

        WorkOSV2::Types::ListStruct.new(
          data: users,
          list_metadata: parsed_response['listMetadata'],
        )
      end

      # Retrieve the directory group with the given ID.
      #
      # @param [String] id The ID of the directory group.
      #
      # @return WorkOSV2::DirectoryGroup
      sig { params(id: String).returns(WorkOSV2::DirectoryGroup) }
      def get_group(id)
        response = execute_request(
          request: get_request(
            path: "/directory_groups/#{id}",
            auth: true,
          ),
        )

        ::WorkOSV2::DirectoryGroup.new(response.body)
      end

      # Retrieve the directory user with the given ID.
      #
      # @param [String] id The ID of the directory user.
      #
      # @return WorkOSV2::DirectoryUser
      sig { params(id: String).returns(WorkOSV2::DirectoryUser) }
      def get_user(id)
        response = execute_request(
          request: get_request(
            path: "/directory_users/#{id}",
            auth: true,
          ),
        )

        ::WorkOSV2::DirectoryUser.new(response.body)
      end

      # Delete the directory with the given ID.
      #
      # @param [String] id The ID of the directory.
      #
      # @return Boolean
      sig { params(id: String).returns(T::Boolean) }
      def delete_directory(id)
        request = delete_request(
          auth: true,
          path: "/directories/#{id}",
        )

        response = execute_request(request: request)

        response.is_a? Net::HTTPSuccess
      end
    end
  end
end
