import netCDF4 as nc
import numpy as np

class Settings
    input_grid_file='/leonardo_work/OGS23_PRACE_IT_0/sspada00/3dvar_MER_T1/TEMP/mask.nc'
    output_grid_file='/leonardo_work/OGS23_PRACE_IT_0/sspada00/3dvar_MER_T1/MER_3dvar/grid1.nc'
    
    in_dim_lon='lon'
    in_dim_lat='lat'
    in_dim_depth='depth'
    in_dim_za='z_a'
    
    in_var_lon='nav_lon'
    in_var_lat='nav_lat'
    in_var_depth='depth'
    in_var_tmask='tmask'
    in_var_e1t='e1t'
    in_var_e2t='e2t'
    in_var_CellBottoms='CellBottoms'
    
    use_const_dx_dy=True
    const_dx_dy=750
    
def squeeze_var(dataset, var):
    return np.squeeze(dataset[var][:])
    
def make_grid(settings):
    with nc.Dataset(input_grid_file, 'r') as input_grid:
        in_lon=np.squeeze(input_grid[in_var_lon][:])
        in_lat=np.squeeze(input_grid[in_var_lat][:])
        in_depth=np.squeeze(input_grid[in_var_depth][:])
        in_tmask=np.squeeze(input_grid[in_var_tmask][:])
        in_CellBottoms=np.squeeze(input_grid[in_var_CellBottoms][:])
        if not use_const_dx_dy:
            in_e1t=np.squeeze(input_grid[in_var_e1t][:])
            in_e2t=np.squeeze(input_grid[in_var_e2t][:])
    
    with nc.Dataset(output_grid_file, 'w', format='NETCDF3_CLASSIC') as output_grid:
        km,jm,im=in_tmask.shape
        
        output_grid.createDimension("im", im)
        output_grid.createDimension("jm", jm)
        output_grid.createDimension("km", km)
        
        float dep(km) ;
                dep:units = "meters" ;
        float dx(jm, im) ;
                dx:long_name = "Resolution in X" ;
                dx:units = "meters" ;
        float dy(jm, im) ;
                dy:long_name = "Resolution in Y" ;
                dy:units = "meters" ;
        float dz(km) ;
                dz:long_name = "Resolution in Z" ;
                dz:units = "meters" ;
        float lat(jm, im) ;
                lat:units = "degrees_north" ;
        float lon(jm, im) ;
                lon:units = "degrees_east" ;
        float regs(jm, im) ;
                regs:long_name = "Regions" ;
                regs:units = "" ;
        float tmsk(km, jm, im) ;
                tmsk:long_name = "T points mask" ;
                tmsk:units = "" ;
        out_lon=output_grid.createVariable("lon", np.float32, ("time",), fill_value=settings.fillValue)
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        float dep(km) ;
                dep:units = "meters" ;
        float dx(jm, im) ;
                dx:long_name = "Resolution in X" ;
                dx:units = "meters" ;
        float dy(jm, im) ;
                dy:long_name = "Resolution in Y" ;
                dy:units = "meters" ;
        float dz(km) ;
                dz:long_name = "Resolution in Z" ;
                dz:units = "meters" ;
        float lat(jm, im) ;
                lat:units = "degrees_north" ;
        float lon(jm, im) ;
                lon:units = "degrees_east" ;
        float regs(jm, im) ;
                regs:long_name = "Regions" ;
                regs:units = "" ;
        float tmsk(km, jm, im) ;
                tmsk:long_name = "T points mask" ;
                tmsk:units = "" ;

def main():
    settings=Settings()
    make_grid(settings)
    
if __name__ == "__main__":
    main()
