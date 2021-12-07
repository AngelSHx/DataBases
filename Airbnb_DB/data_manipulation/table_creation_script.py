# -*- coding: utf-8 -*-
"""
Spyder Editor

"""

# =============================================================================
# # imports and prep
# =============================================================================

# imports
from pathlib import Path
import pandas as pd
import numpy as np

# set path |            *replace with your path*
file_path = Path("C:/Users/lmk3n/OneDrive/Documents/MSBX_5405/Final_proj/")

# read in files; convert to pandas df
calendar_file = file_path / "calendar.csv"
listings_file = file_path / "listings.csv"
reviews_file = file_path / "reviews.csv"

calendar = pd.read_csv(calendar_file)
listings = pd.read_csv(listings_file)
reviews = pd.read_csv(reviews_file)



# =============================================================================
# # Create ready-to-load tables for Airbnb database
# =============================================================================

### Hosts ###
hosts = listings[['host_id', 
                  'host_name']]

hosts.columns = ['HostID', 
                 'HostFirstName']

hosts.drop_duplicates(inplace=True)


### Travelers ###
travelers = reviews[['reviewer_id', 
                     'reviewer_name']]

travelers.columns = ['TravelerID', 
                     'TravelerFirstName']

travelers.drop_duplicates(inplace=True)


### Neighborhoods ###
neighborhoods = listings[['neighbourhood_cleansed']]

neighborhoods.columns = ['NeighborhoodName']

neighborhoods.drop_duplicates(inplace=True)

neighborhoods['NeighborhoodID'] = np.arange(1, neighborhoods.shape[0] + 1)


### Property Type
propertyTypes = listings[['property_type']]

propertyTypes.columns = ['PropertyTypeName']

propertyTypes.drop_duplicates(inplace=True)

propertyTypes['PropertyTypeID'] = np.arange(1, propertyTypes.shape[0] + 1)


### Properties ###
listings0 = listings.merge(propertyTypes,
                           left_on='property_type',
                           right_on='PropertyTypeName')

listings1 = listings0.merge(neighborhoods,
                            left_on='neighbourhood_cleansed',
                            right_on='NeighborhoodName')

properties = listings1[['id', 
                        'PropertyTypeID',
                        'host_id',
                        'NeighborhoodID',
                        'name',
                        'price']]

properties.columns = ['PropertyID', 
                      'PropertyTypeID', 
                      'HostID', 
                      'NeighborhoodID',
                      'ListingName',
                      'Price']


### Property Reviews ###
propertyReviews = reviews[['id',
                           'listing_id',
                           'reviewer_id',
                           'comments',
                           'date']]

propertyReviews.columns = ['PropertyReviewsID',
                           'PropertyID',
                           'TravelerID',
                           'Comment',
                           'ReviewDate']


### Amenities ###       *not efficient but it works*
PetFriendly = []
WiFi = []
TV = []
AirConditioning = []
Pool = []
FreeParking = []

for i in range(listings.shape[0]):
    if 'Pets allowed' in str(listings[['amenities']].iloc[i].values):
        PetFriendly.append(True)
    else: 
        PetFriendly.append(False)
    
    if 'Free parking' in str(listings[['amenities']].iloc[i].values):
        FreeParking.append(True)
    else:
        FreeParking.append(False)
        
    if 'Pool' in str(listings[['amenities']].iloc[i].values):
        Pool.append(True)
    else:
        Pool.append(False)
    
    if 'Air conditioning' in str(listings[['amenities']].iloc[i].values):
        AirConditioning.append(True)
    else:
        AirConditioning.append(False)
        
    if 'TV' in str(listings[['amenities']].iloc[i].values):
        TV.append(True)
    else:
        TV.append(False)
        
    if 'Wifi' in str(listings[['amenities']].iloc[i].values):
        WiFi.append(True)
    else:
        WiFi.append(False)

amenities = pd.DataFrame({'PropertyID':listings['id'],
                         'PetFriendly':PetFriendly,
                         'WiFi':WiFi,
                         'TV':TV,
                         'AirConditioning':AirConditioning,
                         'Pool':Pool,
                         'FreeParking':FreeParking})


### Bookings ###        *not feasible?*



# =============================================================================
# # write to .csv
# =============================================================================
hosts_output = file_path / "hosts.csv"
travelers_output = file_path / "travelers.csv"
properties_output = file_path / "properties.csv"
propertyTypes_output = file_path / "property_types.csv"
propertyReviews_output = file_path / "property_reviews.csv"
amenities_output = file_path / "amenities.csv"
# bookings_output = file_path / "bookings.csv"
neighborhoods_output = file_path / "neighborhoods.csv"

hosts.to_csv(hosts_output, index=False)
travelers.to_csv(travelers_output, index=False)
properties.to_csv(properties_output, index=False)
neighborhoods.to_csv(neighborhoods_output, index=False)
propertyTypes.to_csv(propertyTypes_output, index=False)
propertyReviews.to_csv(propertyReviews_output, index=False)
amenities.to_csv(amenities_output, index=False)
# bookings.to_csv(output)