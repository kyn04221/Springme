package com.busanit501.helloword2.member.dao;

import com.busanit501.helloword2.member.dto.MemberVO;
import lombok.Cleanup;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberLoginDAO {
    public MemberVO getMemberWithpw(String mid, String mpw) throws SQLException {
        String query = "select * from member where mid=? and mpw=?";
        // 결과 데이터를 담아둘 임시 박스 MemberVO
        MemberVO memberVO = null;
        @Cleanup Connection connection = MemberConnectionUtil.INSTANCE.getConnection();
        @Cleanup PreparedStatement preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, mid);
        preparedStatement.setString(2, mpw);
        @Cleanup ResultSet resultSet = preparedStatement.executeQuery();
        resultSet.next();

        memberVO = MemberVO.builder()
                .mno(resultSet.getLong("mno"))
                .mid(resultSet.getString("mid"))
                .mpw(resultSet.getString("mpw"))
                .mname(resultSet.getString("mname"))
                .build();
        return memberVO;

    }
}