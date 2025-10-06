package com.sava;

import java.sql.Timestamp;

public class FileRecord {
    private int id;
    private String fileName;
    private String filePath;
    private Timestamp uploadedAt;
    private String app_type;
    private String app_name;
    private String app_version;
    private String app_platform;


    public FileRecord(int id, String fileName, String filePath, Timestamp uploadedAt, String app_type, String app_name, String app_version, String app_platform) {
        this.id = id;
        this.fileName = fileName;
        this.filePath = filePath;
        this.uploadedAt = uploadedAt;
        this.app_type = app_type;
        this.app_name = app_name;
        this.app_version = app_version;
        this.app_platform = app_platform;
    }

    public int getId() { return id; }
    public String getFileName() { return fileName; }
    public String getFilePath() { return filePath; }
    public Timestamp getUploadedAt() { return uploadedAt; }
    public String getType() { return app_type; }
    public String getVersion() { return app_version; }
    public String getAppPlatform() { return app_platform; }
    public String getAppName() { return app_version; }
}
