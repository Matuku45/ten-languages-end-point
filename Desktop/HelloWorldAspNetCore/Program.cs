var builder = WebApplication.CreateBuilder(args);

// ✅ Add CORS policy to allow all origins
builder.Services.AddCors(options =>
{
    options.AddPolicy("AllowAll", policy =>
        policy.AllowAnyOrigin()
              .AllowAnyMethod()
              .AllowAnyHeader());
});

// Add services to the container.
builder.Services.AddControllers();

var app = builder.Build();

// ✅ Enable CORS middleware
app.UseCors("AllowAll");

app.UseHttpsRedirection();
app.UseAuthorization();

app.MapControllers();

app.Run();
