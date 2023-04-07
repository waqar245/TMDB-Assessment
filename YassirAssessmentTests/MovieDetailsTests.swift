//
//  YassirAssessmentTests.swift
//  YassirAssessmentTests
//
//  Created by Waqar Ahmed on 05/04/2023.
//

import XCTest
@testable import YassirAssessment

final class MovieDetailsTests: XCTestCase {

    var viewModel: MovieDetailsViewModel!
    
    override func setUp() {
        super.setUp()
        viewModel = MovieDetailsViewModel(service: MoviesMockService(), movieId: 502356)
    }

    override func tearDown() {
        super.tearDown()
        viewModel = nil
    }

    func testFetchMovieDetails() async throws {
        
        await viewModel.fetchMovieDetails()
        
        XCTAssertEqual(viewModel.movie?.id, 502356)
        XCTAssertEqual(viewModel.movie?.title, "The Super Mario Bros. Movie")
        XCTAssertEqual(viewModel.movie?.backdropPath, "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg")
    }
    
    func testMovieDetailsRunTimeFormatting() async throws {
        
        await viewModel.fetchMovieDetails()
        
        XCTAssertEqual(viewModel.movie?.runtime, 92)
        XCTAssertEqual(viewModel.movie?.runTimeFormatted(), "1h 32min")
    }
    
    func testMovieDateFormatting() async throws {
        
        await viewModel.fetchMovieDetails()
        
        let formattedDate = DateFormatterUtility.mediumStyleFormatter.string(from: (viewModel.movie?.releaseDate)!)
        XCTAssertEqual(formattedDate, "Apr 5, 2023")
    }
    
    func testMovieCast() async throws {
        
        await viewModel.fetchMovieDetails()
        
        XCTAssertEqual(viewModel.cast?.count, 6)
        
        XCTAssertEqual(viewModel.cast?.first?.id, 73457)
        XCTAssertEqual(viewModel.cast?.first?.name, "Chris Pratt")
        XCTAssertEqual(viewModel.cast?.first?.character, "Mario (voice)")
    }
}
