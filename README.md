# opentelemetry-swift

A fork of <https://github.com/open-telemetry/opentelemetry-swift> that
allows compiling these targets on Linux:

- OpenTelemetryApi
- OpenTelemetrySdk
- SwiftMetricsShim
- DatadogExporter

This should allow you to use the [Apple Swift Metrics API](https://github.com/apple/swift-metrics) with the `SwiftMetricsShim` to export to Datadog.

**Note: definitely not production ready.**
