public class BusScheduleCache {
    private Cache.OrgPartition part;
    
    public BusScheduleCache(){
        Cache.OrgPartition partition = Cache.Org.getPartition('local.BusSchedule');		//assing directly to part
        part = partition;
    }
    
    public void putSchedule(String busLine, Time[] schedule){
        Map<String, Time[]> busLineScheduleMap = new Map<String, Time[]>();
        busLineScheduleMap.put(busLine, schedule);
        part.put('busLineScheduleMap', busLineScheduleMap);
    }
    
    public Time[] getSchedule(String busLine){
        Map<String, Time[]> busLineScheduleMap = (Map<String, Time[]>)part.get('busLineScheduleMap');
        if(busLineScheduleMap != null){
            return busLineScheduleMap.get(busLine);
        }
        return new Time[]{Time.newInstance(8, 0, 0, 0),Time.newInstance(17, 0, 0, 0)};
    }
}