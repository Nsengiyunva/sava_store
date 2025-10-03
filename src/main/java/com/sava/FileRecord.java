package com.sava;

import java.sql.Timestamp;

public class FileRecord {
    private int id;
    private String fileName;
    private String filePath;
    private Timestamp uploadedAt;

    public FileRecord(int id, String fileName, String filePath, Timestamp uploadedAt) {
        this.id = id;
        this.fileName = fileName;
        this.filePath = filePath;
        this.uploadedAt = uploadedAt;
    }

    public int getId() { return id; }
    public String getFileName() { return fileName; }
    public String getFilePath() { return filePath; }
    public Timestamp getUploadedAt() { return uploadedAt; }
}
