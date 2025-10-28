using Prometheus;

var builder = WebApplication.CreateBuilder(args);
var app = builder.Build();

// Expose metrics at /metrics
app.UseMetricServer();        // exposes /metrics
app.UseHttpMetrics();         // optional default metrics

app.MapGet("/", () => Results.Ok(new { message = "Hello from backend" }));
app.MapGet("/health", () => Results.Ok("healthy"));

app.Run();