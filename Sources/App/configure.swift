import Vapor
import FluentPostgresDriver
import Fluent

// configures your application
public func configure(_ app: Application) async throws {
    // guard let databaseURL = Environment.get("DATABASE_URL")
    // else {
    //     app.shutdown()
    //     print("Could not load variable environment. Shutting down the app.")
    //     return
    // }
    let databaseURL = "postgres://koyeb-adm:COPaWFU78kKe@ep-cold-snowflake-a2ljnuov.eu-central-1.pg.koyeb.app:5432/koyebdb"
    
    try app.databases.use(.postgres(url: databaseURL), as: .psql)
    app.migrations.add(RoadmapFeature.Create())
    app.logger.logLevel = .debug

    try await app.autoMigrate()

    // register routes
    try routes(app)
}
