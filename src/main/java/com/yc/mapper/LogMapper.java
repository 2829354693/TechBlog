package com.yc.mapper;

import com.yc.model.Log;

import java.util.List;

public interface LogMapper {
    void insertLog(Log log) throws Exception;

    List<Log> getAllLog() throws Exception;
}
