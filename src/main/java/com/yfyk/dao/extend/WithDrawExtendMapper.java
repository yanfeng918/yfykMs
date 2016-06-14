package com.yfyk.dao.extend;

import com.yfyk.dao.mbg.WithDrawMapper;
import com.yfyk.dto.request.GetWithDrawListRequest;
import com.yfyk.dto.response.GetWithDrawListResponse;

import java.util.List;


public interface WithDrawExtendMapper extends WithDrawMapper{

    List<GetWithDrawListResponse> getWithDrawList(GetWithDrawListRequest request);

    int getWithDrawListCount(GetWithDrawListRequest request);

}