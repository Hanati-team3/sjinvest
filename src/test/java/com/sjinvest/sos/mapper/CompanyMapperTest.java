package com.sjinvest.sos.mapper;

import java.sql.SQLException;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.sjinvest.sos.company.domain.Company;
import com.sjinvest.sos.company.mapper.CompanyMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CompanyMapperTest {

	@Inject
	private CompanyMapper companyMapper;

	@Test
	public void testRead() throws SQLException {
		log.info(companyMapper);
		Company company = companyMapper.readByNumber("003350");
		log.info(company);
		company = companyMapper.readByName("아모레퍼시픽");
		log.info(company);
		List<Company> companyList = companyMapper.readByFieldName("화장품");
		log.info(companyList.size());
		companyList = companyMapper.readByFieldNumber(3);
		log.info(companyList.size());
		companyList = companyMapper.search("아모레");
		log.info(companyList.size());
	}
}







