# frozen_string_literal: true
# typed: true

require 'workosv2/version'
require 'sorbet-runtime'
require 'json'
require 'workosv2/hash_provider'
require 'workosv2/configuration'

# Use the WorkOSV2 module to authenticate your
# requests to the WorkOSV2 API. The gem will read
# your API key automatically from the ENV var `WORKOS_API_KEY`.
# Alternatively, you can set the key yourself with
# `WorkOSV2.key = [your api key]` somewhere in the load path of
# your application, such as an initializer.
module WorkOSV2
  API_HOSTNAME = ENV['WORKOS_API_HOSTNAME'] || 'api.workos.com'

  def self.key=(value)
    warn '`WorkOSV2.key=` is deprecated. Use `WorkOSV2.configure` instead.'

    config.key = value
  end

  def self.key
    warn '`WorkOSV2.key` is deprecated. Use `WorkOSV2.configure` instead.'

    config.key
  end

  def self.config
    @config ||= Configuration.new
  end

  def self.configure
    yield(config)
  end

  autoload :Types, 'workosv2/types'
  autoload :Client, 'workosv2/client'
  autoload :Configuration, 'workosv2/configuration'
  autoload :AuditLogExport, 'workosv2/audit_log_export'
  autoload :AuditLogs, 'workosv2/audit_logs'
  autoload :AuditTrail, 'workosv2/audit_trail'
  autoload :Connection, 'workosv2/connection'
  autoload :DirectorySync, 'workosv2/directory_sync'
  autoload :Directory, 'workosv2/directory'
  autoload :DirectoryGroup, 'workosv2/directory_group'
  autoload :Event, 'workosv2/event'
  autoload :Events, 'workosv2/events'
  autoload :Organization, 'workosv2/organization'
  autoload :Organizations, 'workosv2/organizations'
  autoload :Passwordless, 'workosv2/passwordless'
  autoload :Portal, 'workosv2/portal'
  autoload :Profile, 'workosv2/profile'
  autoload :ProfileAndToken, 'workosv2/profile_and_token'
  autoload :SSO, 'workosv2/sso'
  autoload :DirectoryUser, 'workosv2/directory_user'
  autoload :Webhook, 'workosv2/webhook'
  autoload :Webhooks, 'workosv2/webhooks'
  autoload :MFA, 'workosv2/mfa'
  autoload :Factor, 'workosv2/factor'
  autoload :Challenge, 'workosv2/challenge'
  autoload :VerifyChallenge, 'workosv2/verify_challenge'
  autoload :DeprecatedHashWrapper, 'workosv2/deprecated_hash_wrapper'


  # Errors
  autoload :APIError, 'workosv2/errors'
  autoload :AuthenticationError, 'workosv2/errors'
  autoload :InvalidRequestError, 'workosv2/errors'
  autoload :SignatureVerificationError, 'workosv2/errors'
  autoload :TimeoutError, 'workosv2/errors'

  # Remove WORKOS_KEY at some point in the future. Keeping it here now for
  # backwards compatibility.
  key = ENV['WORKOS_API_KEY'] || ENV['WORKOS_KEY']
  config.key = key unless key.nil?
end
