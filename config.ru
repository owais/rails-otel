# This file is used by Rack-based servers to start the application.

require 'opentelemetry/sdk'
require 'opentelemetry/exporter/jaeger'

# Configure the sdk with default export and context propagation formats
# see SDK#configure for customizing the setup
OpenTelemetry::SDK.configure do |c|
  c.use_all
  c.add_span_processor(
    OpenTelemetry::SDK::Trace::Export::BatchSpanProcessor.new(
      exporter: OpenTelemetry::Exporter::Jaeger::CollectorExporter.new(endpoint: 'http://localhost:14268/api/traces?format=jaeger.thrift')
    )
  )
  c.service_name = 'otel-rails'
  c.service_version = '0.1.0'
end

require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
