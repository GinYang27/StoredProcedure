
@Override
	public Float getMassageAvgRateByMassageStoreId(Integer massageStoreId) {
		Query query = getSession().createSQLQuery("CALL GetAvgReview(:storeId)").setParameter("storeId", massageStoreId);
		return ((BigDecimal)query.uniqueResult()).floatValue();
	}

	@Override
	public Integer getMassageAmountRateByMassageStoreId(Integer massageStoreId) {
		Query query = getSession().createSQLQuery("CALL GetAmountReview(:storeId)").setParameter("storeId", massageStoreId);
		return ((BigInteger)query.uniqueResult()).intValue();
	}
