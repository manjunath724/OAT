# OAT

An Online Assessment Test Application that lets a Job Provider schedule and conduct an online test for Applicants.

## App Features

- **Employer** can
  - Create Questionnaire with Questions
  - Add Candidates profile
  - Assign Test to a Candidate
  - Review Test Submissions
  - Give Performance Ratings
- **Candidate** can
  - Add Answers
  - Submit Test

## Developed Using

- MacOS
- Rails v6.0.x
- Ruby v2.6.x
- StimulusJS
- TailwindCSS

## Installation Guide

- Clone the repo
```
git clone git@github.com:manjunath724/OAT.git
```
- Switch to Ruby v2.6.6
```
rvm use ruby-2.6.6
```
- bundle
```
bundle install
```
- Create Database
```
rails db:create
```
- Run Migrations to create tables
```
rails db:migrate
```
- Start Rails Server
```
rails s
```
