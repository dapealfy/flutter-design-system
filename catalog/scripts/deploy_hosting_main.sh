#!/bin/bash

# Run firebase hosting deploy
firebase use --token $FIREBASE_TOKEN testing-project-b8e11

# Deploy to firebase hosting
firebase deploy --only hosting --non-interactive
