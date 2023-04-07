//
//  YassirAssessmentTests.swift
//  YassirAssessmentTests
//
//  Created by Waqar Ahmed on 05/04/2023.
//

import XCTest
@testable import YassirAssessment

final class MoviesListingTests: XCTestCase {

    var listViewModel: MoviesListingViewModel!
    
    override func setUp() {
        super.setUp()
        listViewModel = MoviesListingViewModel(service: MoviesMockService())
    }

    override func tearDown() {
        super.tearDown()
        listViewModel = nil
    }

    func testFetchMovies() async throws {
        
        await listViewModel.fetchTrendingMovies()

        //Test Movies count
        XCTAssertEqual(listViewModel.trendingMovies.count, 20)
        XCTAssertEqual(listViewModel.isLoading, false)
    }
    
    func testFetchMoviesDecoding() async throws {
        
        await listViewModel.fetchTrendingMovies()
        
        let movie = listViewModel.trendingMovies.first!
        XCTAssertEqual(movie.id, 76600)
        XCTAssertEqual(movie.title, "Avatar: The Way of Water")
        XCTAssertEqual(movie.posterPath, "/t6HIqrRAclMCA60NsSmeqe9RmNV.jpg")
    }
    
    func testFetchMoviesPagination() async throws {

        //Fetch 1st page
        await listViewModel.fetchTrendingMovies()

        //Test count
        XCTAssertEqual(listViewModel.trendingMovies.count, 20)
        
        //Fetch next page
        //Note: Using same mock data for the next page as well
        await listViewModel.fetchNextSetIfNeeded(currentMovie: listViewModel.trendingMovies.last!)
        
        //Page is 2 and more movies appended
        XCTAssertEqual(listViewModel.page, 2)
        XCTAssertEqual(listViewModel.trendingMovies.count, 40)
    }

}
