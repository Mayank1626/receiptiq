from typing import List, Optional
from datetime import datetime
from uuid import UUID
from fastapi import APIRouter, Depends, Query

from app.schemas.analytics import (
    DashboardMetrics,
    MonthlySpend,
    StoreAnalytics,
    ProductAnalytics,
    PriceHistory,
    CategoryAnalytics,
    DailyTimeline
)
from app.analytics.filters import AnalyticsFilter
from app.services.analytics_service import AnalyticsService
from app.api.dependencies import get_analytics_service

router = APIRouter(prefix="/analytics", tags=["Analytics"])

def get_analytics_filter(
    start_date: Optional[datetime] = Query(None),
    end_date: Optional[datetime] = Query(None),
    owner_id: Optional[UUID] = Query(None),
    household_id: Optional[UUID] = Query(None)
) -> AnalyticsFilter:
    return AnalyticsFilter(
        start_date=start_date,
        end_date=end_date,
        owner_id=owner_id,
        household_id=household_id
    )

@router.get("/dashboard", response_model=DashboardMetrics, summary="Get Dashboard Metrics")
async def get_dashboard(
    filters: AnalyticsFilter = Depends(get_analytics_filter),
    service: AnalyticsService = Depends(get_analytics_service)
):
    return await service.get_dashboard(filters)

@router.get("/monthly", response_model=List[MonthlySpend], summary="Get Monthly Spend")
async def get_monthly(
    filters: AnalyticsFilter = Depends(get_analytics_filter),
    service: AnalyticsService = Depends(get_analytics_service)
):
    return await service.get_monthly_spend(filters)

@router.get("/timeline", response_model=List[DailyTimeline], summary="Get Daily Timeline")
async def get_timeline(
    filters: AnalyticsFilter = Depends(get_analytics_filter),
    service: AnalyticsService = Depends(get_analytics_service)
):
    return await service.get_daily_timeline(filters)

@router.get("/stores", response_model=List[StoreAnalytics], summary="Get Store Analytics")
async def get_stores(
    filters: AnalyticsFilter = Depends(get_analytics_filter),
    service: AnalyticsService = Depends(get_analytics_service)
):
    return await service.get_store_analytics(filters)

@router.get("/products", response_model=List[ProductAnalytics], summary="Get Product Analytics")
async def get_products(
    filters: AnalyticsFilter = Depends(get_analytics_filter),
    service: AnalyticsService = Depends(get_analytics_service)
):
    return await service.get_product_analytics(filters)

@router.get("/product/{name}", response_model=PriceHistory, summary="Get Product Price History")
async def get_product_history(
    name: str,
    filters: AnalyticsFilter = Depends(get_analytics_filter),
    service: AnalyticsService = Depends(get_analytics_service)
):
    return await service.get_product_history(name, filters)

@router.get("/categories", response_model=List[CategoryAnalytics], summary="Get Category Analytics")
async def get_categories(
    filters: AnalyticsFilter = Depends(get_analytics_filter),
    service: AnalyticsService = Depends(get_analytics_service)
):
    return await service.get_category_analytics(filters)
