package com.yc.service.impl;

import com.yc.mapper.LogMapper;
import com.yc.model.Log;
import com.yc.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LogServiceImpl implements LogService {

    @Autowired
    LogMapper logMapper;

    @Override
    public List<Log> getAllLog() throws Exception {
        return logMapper.getAllLog();
    }
}
