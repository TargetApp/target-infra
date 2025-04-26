# v0

The **v0** setup implements the database, queue, and storage components using MySQL. This setup is designed to be a minimal and straightforward implementation.

## Components

1. **Database**:
   - Stores user information, models, images, and reports.
   - Defined in [`create_database.sql`](../../components/database/mysql/create_database.sql).

2. **Queue**:
   - Manages processing and validation queues for image analysis tasks.
   - Defined in [`create_queue.sql`](../../components/queue/mysql/create_queue.sql).

3. **Storage**:
   - Stores image data, segmentation masks, and model weights.
   - Defined in [`create_storage.sql`](../../components/storage/mysql/create_storage.sql).

## Configuration Files

- **Docker Compose**:
  - The setup uses Docker Compose to orchestrate the MySQL service.
  - Configuration is available in [`docker-compose.yml`](docker-compose.yml).

- **User Management**:
  - SQL script to create and configure MySQL users with appropriate permissions.
  - Available in [`create_users.sql`](create_users.sql).
  - A helper script, [`create_users.sh`](create_users.sh), automates user creation and password replacement.

- **Settings**:
  - Configuration files for different modules:
    - [`settings.toml`](settings.toml): General settings for database, queue, and storage.
    - [`insert_model_settings.toml`](insert_model_settings.toml): Settings for inserting models.
    - [`enqueue_report_settings.toml`](enqueue_report_settings.toml): Settings for enqueuing reports.

## How to Use

1. **Start the MySQL Service**:
   - Use Docker Compose to start the MySQL service:
     ```sh
     docker-compose up -d
     ```

2. **Create Users**:
   - Run the `create_users.sh` script to create MySQL users:
     ```sh
     bash create_users.sh create_users.sql settings.toml insert_model_settings.toml enqueue_report_settings.toml
     ```

3. **Initialize Databases**:
   - The database, queue, and storage schemas are automatically initialized using the SQL scripts mounted in the Docker container.