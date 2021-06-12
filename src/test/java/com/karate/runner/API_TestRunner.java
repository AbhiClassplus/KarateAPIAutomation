package com.karate.runner;

import org.apache.commons.io.FileUtils;
import org.junit.jupiter.api.Test;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.junit5.Karate;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import static org.junit.jupiter.api.Assertions.*;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;



public class API_TestRunner {
	
	/*
	 * @Karate.Test Karate testSample() { return
	 * Karate.run("reqresGet.feature").relativeTo(getClass()); }
	 */
	   	   
	   @Test
	    void testParallel() {
	        Results results = Runner.path("classpath:com/karate/runner").outputCucumberJson(true).parallel(1);
	        generateReport(results.getReportDir());
	        assertEquals(0, results.getFailCount(), results.getErrorMessages());
	    }

	    public static void generateReport(String karateOutputPath) {
            Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] {"json"}, true);
            List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
            jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
            Configuration config = new Configuration(new File("target"), "demo");
            ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
            reportBuilder.generateReports();
    }
}
